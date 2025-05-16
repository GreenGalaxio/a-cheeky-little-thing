// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.NSpecBombThrown_103

package bomberman_fla
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

    public dynamic class NSpecBombThrown_103 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var projectile:*;
        public var level:*;
        public var character:*;

        public function NSpecBombThrown_103()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 8, this.frame9, 15, this.frame16, 16, this.frame17, 23, this.frame24, 24, this.frame25, 32, this.frame33);
        }

        public function toContinue(_arg_1:*):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_LAND, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.toContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
            gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            this.projectile = this.self;
            this.level = 1;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                this.self.faceRight();
                this.self.updateAttackBoxStats(1, {"priority":2});
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_LAND, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.toContinue);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
            };
        }

        internal function frame8():*
        {
            gotoAndPlay("level1");
        }

        internal function frame9():*
        {
            this.self.updateAttackBoxStats(1, {"priority":4});
            this.level = 2;
        }

        internal function frame16():*
        {
            gotoAndPlay("level2");
        }

        internal function frame17():*
        {
            this.level = 3;
            this.self.updateAttackBoxStats(1, {"priority":5});
        }

        internal function frame24():*
        {
            gotoAndPlay("level3");
        }

        internal function frame25():*
        {
            if (this.level == 1)
            {
                this.self.attachEffect("explosionNew");
                SSF2API.shakeCamera(3);
            }
            else
            {
                if (this.level == 2)
                {
                    this.self.attachEffect("explosionNewBig");
                    SSF2API.shakeCamera(6);
                }
                else
                {
                    if (this.level == 3)
                    {
                        this.self.attachEffect("explosionNewPower");
                        SSF2API.shakeCamera(10);
                    };
                };
            };
            SSF2API.playSound("bomberman_explode");
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
        }

        internal function frame33():*
        {
            gotoAndPlay("end");
        }


    }
}//package bomberman_fla

