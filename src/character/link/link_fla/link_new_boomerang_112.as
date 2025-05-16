// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_new_boomerang_112

package link_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
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
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class link_new_boomerang_112 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;

        public function link_new_boomerang_112()
        {
            addFrameScript(0, this.frame1, 18, this.frame19, 25, this.frame26, 34, this.frame35, 40, this.frame41);
        }

        public function toContinue(_arg_1:*):void
        {
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_POWER_SHIELD, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
            this.gotoAndPlay("continue");
        }

        public function bounce(_arg_1:*):void
        {
            this.self.setYSpeed(-(this.self.getYSpeed()));
            this.self.updateProjectileStats({
                "maxgravity":0,
                "gravity":0
            });
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
        }

        public function destroy(_arg_1:*):void
        {
            if ((((_arg_1.data.caller == this.self) && (_arg_1.data.opponent == this.character)) && (!(this.self.isReversed()))))
            {
                if (this.character.getCharacterStat("statsName") == "link")
                {
                    if (((((((((this.character.getMC().xframe == "stand") || (this.character.getMC().xframe == "walk")) || (this.character.getMC().xframe == "run")) || (this.character.getMC().xframe == "jump")) || (this.character.getMC().xframe == "jump_midair")) || (this.character.getMC().xframe == "fall")) || (this.character.getMC().xframe == "skid")) || (this.character.getMC().xframe == "taunt")))
                    {
                        if (this.character.isOnGround())
                        {
                            this.character.forceAttack("b_forward", "boomerang");
                        }
                        else
                        {
                            this.character.forceAttack("b_forward_air", "boomerang");
                        };
                        this.character.getStanceMC().fromProjectile = true;
                    };
                };
                this.self.destroy();
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_POWER_SHIELD, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
            };
        }

        internal function frame19():*
        {
            this.self.updateProjectileStats({
                "maxgravity":0.6,
                "gravity":0.5
            });
        }

        internal function frame26():*
        {
            this.self.updateAttackBoxStats(1, {
                "stackKnockback":false,
                "damage":1,
                "direction":168,
                "power":20,
                "hitStun":1,
                "selfHitStun":1,
                "hitLag":-1,
                "weightKB":140,
                "hasEffect":true,
                "sdiDistance":1,
                "effect_id":null
            });
            this.self.updateAttackStats({"refreshRate":4});
            this.self.updateProjectileStats({
                "rotate":false,
                "ghost":true
            });
            this.self.setRotation(0);
        }

        internal function frame35():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.PROJ_COLLIDE, this.destroy);
        }

        internal function frame41():*
        {
            gotoAndPlay("returning");
        }


    }
}//package link_fla

