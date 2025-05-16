// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_megaman_177

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class kirby_megaman_177 extends MovieClip 
    {

        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var action:String;
        public var rapidFire:Number;
        public var checkPress:Boolean;
        public var effectProject:*;
        public var controls:Object;
        public var chargeTime:*;
        public var megaman_controls:Object;
        public var megaman_dir:Boolean;

        public function kirby_megaman_177()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 8, this.frame9, 9, this.frame10, 25, this.frame26, 26, this.frame27, 29, this.frame30, 31, this.frame32, 32, this.frame33, 36, this.frame37, 49, this.frame50, 50, this.frame51, 51, this.frame52, 59, this.frame60, 60, this.frame61, 70, this.frame71);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            this.action = "standing";
            this.rapidFire = 0;
            this.checkPress = true;
            this.effectProject = null;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
                this.self.updateAttackStats({"cancelWhenAirborne":false});
                this.self.attachEffect("bustercharge");
                this.self.updateAttackStats({
                    "allowRun":true,
                    "allowControl":false
                });
            };
        }

        internal function frame2():*
        {
            this.xframe = "charging";
            this.action = "standing";
            this.self.updateAttackStats({
                "allowRun":true,
                "allowControl":false
            });
        }

        internal function frame9():*
        {
            this.gotoAndPlay("standing");
        }

        internal function frame10():*
        {
            this.xframe = "charging";
            this.action = "moving";
        }

        internal function frame26():*
        {
            this.gotoAndPlay("moving");
        }

        internal function frame27():*
        {
            this.xframe = "attack";
            this.effectProject = this.self.getGlobalVariable("bustCharge");
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            this.self.updateAttackStats({
                "linkFrames":false,
                "allowJump":false,
                "allowControl":false,
                "allowTurn":false,
                "allowRun":false
            });
        }

        internal function frame30():*
        {
            this.self.playAttackSound(2);
            this.chargeTime = this.self.getExecTime();
            if (this.chargeTime < 15)
            {
                this.self.fireProjectile("megaman_buster1", 6, 8);
            }
            else
            {
                if (this.chargeTime < 25)
                {
                    this.self.fireProjectile("megaman_buster2", 15, -12);
                }
                else
                {
                    this.self.fireProjectile("megaman_buster3", 15, -12);
                };
            };
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }

        internal function frame33():*
        {
            this.xframe = "attack2";
            this.self.updateAttackStats({
                "allowJump":false,
                "allowRun":false,
                "linkFrames":false,
                "allowControl":false,
                "allowTurn":false
            });
            this.self.setXSpeed(-3, false);
            this.effectProject = this.self.getGlobalVariable("bustCharge");
            this.self.playAttackSound(3);
        }

        internal function frame37():*
        {
            this.self.fireProjectile("megaman_buster_full", 30, -20);
        }

        internal function frame50():*
        {
            this.self.endAttack();
        }

        internal function frame51():*
        {
            this.xframe = null;
            this.megaman_controls = this.self.getControls();
            this.megaman_dir = this.self.isFacingRight();
            this.action = "standing";
        }

        internal function frame52():*
        {
            this.xframe = "charging";
            this.action = "rising";
        }

        internal function frame60():*
        {
            this.gotoAndPlay("rising");
        }

        internal function frame61():*
        {
            this.xframe = "charging";
            this.action = "falling";
        }

        internal function frame71():*
        {
            this.gotoAndPlay("falling");
        }


    }
}//package kirby_fla

