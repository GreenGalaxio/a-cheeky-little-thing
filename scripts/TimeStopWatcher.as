package scripts
{
    import com.mcleodgaming.ssf2.engine.GameController;
    import com.mcleodgaming.ssf2.engine.StageData;
    import com.mcleodgaming.ssf2.engine.Character;
    import com.mcleodgaming.ssf2.engine.Projectile;
    import com.mcleodgaming.ssf2.engine.InteractiveSprite;
    import com.mcleodgaming.ssf2.items.Item;
    import com.mcleodgaming.ssf2.engine.ItemGenerator;
    import com.mcleodgaming.ssf2.util.Utils;
    import flash.display.MovieClip;
    import flash.events.Event;

    /**
     * TimeStopWatcher provides a simple way to freeze gameplay objects
     * without modifying the engine. Create an instance with the owning
     * Character and call activate() when you want to start the freeze.
     * Call update() every frame (e.g. via Event.ENTER_FRAME) while active.
     */
    public class TimeStopWatcher
    {
        private var _owner:Character;
        private var _framesLeft:int = 0;
        private var _affectOwner:Boolean = false;
        private var _affectTeam:Boolean = true;
        private var _affectProjectiles:Boolean = true;
        private var _stage:StageData;
        private var _started:Boolean = false;

        public function TimeStopWatcher(owner:Character)
        {
            _owner = owner;
            _stage = GameController.stageData;
        }

        /**
         * Begin a time stop for the given number of frames.
         * @param frames  Number of frames the stop lasts
         * @param affectOwner  Freeze the owner as well
         * @param affectTeam   Freeze teammates of the owner
         * @param affectProjectiles Freeze the owner's projectiles
         */
        public function activate(frames:int,
                                 affectOwner:Boolean = false,
                                 affectTeam:Boolean = true,
                                 affectProjectiles:Boolean = true):void
        {
            _framesLeft = frames;
            _affectOwner = affectOwner;
            _affectTeam = affectTeam;
            _affectProjectiles = affectProjectiles;
            _started = false;
        }

        /** Update should be called once per frame while the watcher is active */
        public function update():void
        {
            if (_framesLeft <= 0)
            {
                return;
            }

            if (!_started)
            {
                freezeStage();
                // flag other systems to stop updating
                _stage.StageEvent = true;
                _started = true;
            }

            freezeCharacters();
            freezeProjectiles();
            freezeItems();
            freezeEffects();

            _framesLeft--;
            if (_framesLeft <= 0)
            {
                unfreezeAll();
            }
        }

        private function freezeCharacters():void
        {
            var players:Array = _stage.getPlayerArray();
            for each (var p:Character in players)
            {
                if (p == null) continue;
                if (!_affectOwner && p == _owner) continue;
                if (!_affectTeam && _owner != null && p.Team == _owner.Team && p != _owner) continue;
                p.FreezePlayback = true;
                p.killAllSpeeds();
                if (p.MC && p.MC.stance)
                {
                    MovieClip(p.MC.stance).stop();
                    Utils.recursiveMovieClipPlay(MovieClip(p.MC.stance), false);
                }
            }
        }

        private function freezeProjectiles():void
        {
            if (!_affectProjectiles) return;
            var list:Vector.<Projectile> = _stage.Projectiles;
            for each (var proj:Projectile in list)
            {
                if (proj == null || proj.Dead) continue;
                if (!_affectOwner && proj.PlayerID == _owner.ID) continue;
                proj.setXSpeed(0);
                proj.setYSpeed(0);
                if (proj.Instance)
                {
                    proj.Instance.stop();
                    Utils.recursiveMovieClipPlay(proj.Instance, false);
                }
            }
        }

        private function freezeItems():void
        {
            var gen:ItemGenerator = _stage.ItemsRef;
            if (!gen) return;
            var items:Vector.<Item> = gen.ItemsInUse;
            for each (var it:Item in items)
            {
                if (it == null || it.Dead) continue;
                if (!_affectOwner && it.PlayerID == _owner.ID) continue;
                if (!_affectTeam && _owner != null && it.TeamID == _owner.Team) continue;
                it.setXSpeed(0);
                it.setYSpeed(0);
                if (it.ItemInstance)
                {
                    it.ItemInstance.stop();
                    Utils.recursiveMovieClipPlay(it.ItemInstance, false);
                }
            }
        }

        private function freezeEffects():void
        {
            var container:MovieClip = _stage.StageEffectsRef;
            if (!container) return;
            var i:int = 0;
            while (i < container.numChildren)
            {
                var mc:MovieClip = container.getChildAt(i) as MovieClip;
                if (mc)
                {
                    mc.stop();
                    Utils.recursiveMovieClipPlay(mc, false);
                }
                i++;
            }
        }

        private function freezeStage():void
        {
            if (_stage.StageRef && _stage.StageRef.root)
            {
                _stage.StageRef.stop();
            }
            if (_stage.StageFG && _stage.StageFG.root)
            {
                _stage.StageFG.stop();
                Utils.recursiveMovieClipPlay(_stage.StageFG, false);
            }
            if (_stage.StageBG && _stage.StageBG.root)
            {
                _stage.StageBG.stop();
                Utils.recursiveMovieClipPlay(_stage.StageBG, false);
            }
            if (_stage.ShadowMaskRef && _stage.ShadowMaskRef.root)
            {
                _stage.ShadowMaskRef.stop();
            }
            if (_stage.CamRef)
            {
                _stage.CamRef.pauseBG();
            }
        }

        private function unfreezeAll():void
        {
            _stage.StageEvent = false;

            // resume stage
            if (_stage.StageRef && _stage.StageRef.root)
            {
                _stage.StageRef.play();
            }
            if (_stage.StageFG && _stage.StageFG.root)
            {
                _stage.StageFG.play();
                Utils.recursiveMovieClipPlay(_stage.StageFG, true);
            }
            if (_stage.StageBG && _stage.StageBG.root)
            {
                _stage.StageBG.play();
                Utils.recursiveMovieClipPlay(_stage.StageBG, true);
            }
            if (_stage.ShadowMaskRef && _stage.ShadowMaskRef.root)
            {
                _stage.ShadowMaskRef.play();
            }
            if (_stage.CamRef)
            {
                _stage.CamRef.playBG();
            }

            var players:Array = _stage.getPlayerArray();
            for each (var p:Character in players)
            {
                if (p == null) continue;
                p.FreezePlayback = false;
            }
        }
    }
}
