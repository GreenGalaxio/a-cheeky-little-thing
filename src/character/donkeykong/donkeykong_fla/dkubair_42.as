// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.dkubair_42

package donkeykong_fla
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

    public dynamic class dkubair_42 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;
        public var beganOnGround:*;
        public var pressedLastFrame:*;
        public var controls:Object;
        public var boosting:*;

        public function dkubair_42()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 9, this.frame10, 11, this.frame12, 12, this.frame13, 13, this.frame14, 15, this.frame16, 17, this.frame18, 21, this.frame22, 25, this.frame26, 26, this.frame27, 29, this.frame30, 30, this.frame31, 33, this.frame34, 35, this.frame36, 37, this.frame38, 39, this.frame40, 41, this.frame42, 42, this.frame43, 45, this.frame46, 46, this.frame47, 48, this.frame49, 59, this.frame60);
        }

        public function getControls():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.BUTTON1) && (!(this.pressedLastFrame))))
            {
                this.self.setYSpeed(-6.25);
                this.pressedLastFrame = true;
                this.boosting = true;
            }
            else
            {
                this.boosting = false;
                if (!this.controls.BUTTON1)
                {
                    this.pressedLastFrame = false;
                };
            };
        }

        public function landing():*
        {
            if (((!(this.beganOnGround)) && (this.self.isOnGround())))
            {
                this.self.toLand();
            };
            SSF2API.destroyTimer(this.self, this.landing);
        }

        public function donkeyKopter():*
        {
            if (!this.boosting)
            {
                this.self.setYSpeed(-2);
            };
            this.getControls();
        }

        public function groundLand():*
        {
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.beganOnGround = false;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.self.playAttackSound(1);
                if (this.self.isOnGround())
                {
                    this.beganOnGround = true;
                };
            };
        }

        internal function frame9():*
        {
            this.self.updateAttackBoxStats(1, {"effectSound":"brawl_punch_s"});
        }

        internal function frame10():*
        {
            this.self.playAttackSound(2);
            this.self.attachEffect("dk_upBSmoke");
            this.self.updateAttackStats({
                "superArmor":false,
                "refreshRate":6
            });
            this.self.updateAttackBoxStats(1, {
                "direction":50,
                "power":5,
                "damage":1,
                "hitStun":1,
                "selfHitStun":1,
                "priority":0
            });
            this.pressedLastFrame = false;
            this.boosting = false;
            SSF2API.createTimer(this.self, 1, 40, this.donkeyKopter);
            SSF2API.createTimer(this.self, 1, 70, this.landing);
        }

        internal function frame12():*
        {
            this.self.updateAttackStats({
                "allowControl":true,
                "xSpeedDecayAir":-0.1
            });
        }

        internal function frame13():*
        {
        }

        internal function frame14():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame16():*
        {
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame18():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame22():*
        {
            this.self.playAttackSound(2);
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame26():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame27():*
        {
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame30():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame31():*
        {
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame34():*
        {
            this.self.playAttackSound(2);
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame36():*
        {
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame38():*
        {
            this.self.playAttackSound(2);
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame40():*
        {
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame42():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame43():*
        {
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame46():*
        {
            this.self.playAttackSound(2);
            this.self.updateAttackStats({
                "superArmor":false,
                "refreshRate":20
            });
            this.self.updateAttackBoxStats(1, {
                "direction":70,
                "damage":3,
                "hitStun":3
            });
        }

        internal function frame47():*
        {
            this.self.attachEffect("dk_upBSmoke");
        }

        internal function frame49():*
        {
            this.self.updateAttackStats({
                "air_ease":-1,
                "xSpeedDecayAir":0
            });
            SSF2API.createTimer(this.self, 1, 10, function ():*
            {
                if (self.isOnGround())
                {
                    self.toLand();
                };
            });
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame60():*
        {
            if (SSF2API.isReady())
            {
                this.self.toHelpless();
                this.self.endAttack();
            };
        }


    }
}//package donkeykong_fla

