// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_airkick_59

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.xml.*;

    public dynamic class kirby_airkick_59 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;
        public var landingBool:Boolean;

        public function kirby_airkick_59()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 5, this.frame6, 7, this.frame8, 9, this.frame10, 11, this.frame12, 13, this.frame14, 15, this.frame16, 17, this.frame18, 19, this.frame20, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 30, this.frame31, 32, this.frame33, 34, this.frame35, 36, this.frame37, 38, this.frame39, 40, this.frame41, 42, this.frame43, 44, this.frame45, 47, this.frame48, 49, this.frame50, 55, this.frame56);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        public function landingLag(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            }
            else
            {
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.attachEffect("dairSparkle", {"resize":false});
                if (this.self.getCurrentKirbyPower() != null)
                {
                    gotoAndPlay("haspower");
                };
            };
            this.landingBool = false;
            if (((this.self) && (SSF2API.isReady())))
            {
                this.landingLag(false);
            };
        }

        internal function frame2():*
        {
            this.self.playVoiceSound(2);
        }

        internal function frame6():*
        {
            this.self.playAttackSound(1);
            this.landingLag(true);
        }

        internal function frame8():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame10():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame12():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame14():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame16():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame18():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame20():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame24():*
        {
            this.landingLag(false);
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }

        internal function frame26():*
        {
            this.self.attachEffect("dairSparkle", {"resize":false});
            this.landingLag(false);
        }

        internal function frame27():*
        {
            this.self.playVoiceSound(2);
        }

        internal function frame31():*
        {
            SSF2API.playSound("kirby_attackstar");
            this.landingLag(true);
        }

        internal function frame33():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame35():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame37():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame39():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame41():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame43():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame45():*
        {
            this.self.refreshAttackID();
        }

        internal function frame48():*
        {
            SSF2API.playSound("kirby_attackstar");
        }

        internal function frame50():*
        {
            this.self.endAttack();
        }

        internal function frame56():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

