// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_slidekick_30

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class kirby_slidekick_30 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;

        public function kirby_slidekick_30()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 6, this.frame7, 8, this.frame9, 10, this.frame11, 12, this.frame13, 14, this.frame15, 16, this.frame17, 18, this.frame19, 20, this.frame21, 22, this.frame23, 24, this.frame25, 27, this.frame28, 28, this.frame29, 32, this.frame33, 33, this.frame34, 34, this.frame35, 36, this.frame37, 38, this.frame39, 40, this.frame41, 42, this.frame43, 44, this.frame45, 46, this.frame47, 48, this.frame49, 50, this.frame51, 52, this.frame53, 55, this.frame56);
        }

        public function dashingSpeed():void
        {
            this.self.setXSpeed(3.5, false);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                if (this.self.getCurrentKirbyPower() != null)
                {
                    gotoAndPlay("haspower");
                };
                this.self.setXSpeed(6, false);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame5():*
        {
            this.self.playAttackSound(1);
            if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
            {
                this.self.playVoiceSound(1);
                this.self.setGlobalVariable("audio", 1);
            };
            if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
            {
                this.self.playVoiceSound(2);
                this.self.setGlobalVariable("audio", 2);
            };
            if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
            {
                this.self.playVoiceSound(3);
                this.self.setGlobalVariable("audio", 3);
            };
            if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
            {
                this.self.playVoiceSound(4);
                this.self.setGlobalVariable("audio", 4);
            };
        }

        internal function frame6():*
        {
            SSF2API.createTimer(this.self, 1, 24, this.dashingSpeed);
        }

        internal function frame7():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame9():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame11():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame13():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame15():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame17():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame19():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame21():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame23():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":90,
                "kbConstant":70,
                "damage":4,
                "direction":45
            });
            this.self.updateAttackStats({"refreshRate":50});
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame25():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }

        internal function frame29():*
        {
            this.self.setXSpeed(6, false);
        }

        internal function frame33():*
        {
            this.self.playAttackSound(1);
            SSF2API.playSound("kirby_attackstar");
            if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
            {
                this.self.playVoiceSound(1);
                this.self.setGlobalVariable("audio", 1);
            };
            if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
            {
                this.self.playVoiceSound(2);
                this.self.setGlobalVariable("audio", 2);
            };
            if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
            {
                this.self.playVoiceSound(3);
                this.self.setGlobalVariable("audio", 3);
            };
            if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
            {
                this.self.playVoiceSound(4);
                this.self.setGlobalVariable("audio", 4);
            };
        }

        internal function frame34():*
        {
            SSF2API.createTimer(this.self, 1, 24, this.dashingSpeed);
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
            this.self.playAttackSound(1);
        }

        internal function frame47():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame49():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame51():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":90,
                "kbConstant":70,
                "damage":4,
                "direction":45
            });
            this.self.updateAttackStats({"refreshRate":50});
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame53():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame56():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

