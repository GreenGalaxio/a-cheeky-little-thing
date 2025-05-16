// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_airforward_full__57

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

    public dynamic class kirby_airforward_full__57 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;
        public var landingBool:Boolean;
        public var playsound:Number;
        public var audio:Number;

        public function kirby_airforward_full__57()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 4, this.frame5, 7, this.frame8, 13, this.frame14, 18, this.frame19, 20, this.frame21, 21, this.frame22, 25, this.frame26, 28, this.frame29, 34, this.frame35, 36, this.frame37, 39, this.frame40, 41, this.frame42, 49, this.frame50);
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
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame3():*
        {
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

        internal function frame5():*
        {
            this.self.playAttackSound(1);
            this.landingLag(true);
        }

        internal function frame8():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":3,
                "power":28,
                "kbConstant":30,
                "direction":80
            });
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame14():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":5,
                "power":30,
                "kbConstant":138,
                "direction":45,
                "effectSound":"brawl_kick_l"
            });
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame19():*
        {
            this.landingLag(false);
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }

        internal function frame22():*
        {
            if (this.self.getCurrentKirbyPower() != null)
            {
                gotoAndPlay("haspower");
            };
            this.landingLag(false);
        }

        internal function frame26():*
        {
            this.landingLag(true);
            this.self.playAttackSound(1);
            SSF2API.playSound("kirbystartaunt");
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

        internal function frame29():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":3,
                "power":28,
                "kbConstant":30,
                "direction":80
            });
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame35():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":5,
                "power":30,
                "kbConstant":138,
                "direction":45,
                "effectSound":"brawl_kick_l"
            });
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame37():*
        {
            SSF2API.playSound("kirbystartaunt");
        }

        internal function frame40():*
        {
            this.landingLag(false);
        }

        internal function frame42():*
        {
            this.self.endAttack();
        }

        internal function frame50():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

