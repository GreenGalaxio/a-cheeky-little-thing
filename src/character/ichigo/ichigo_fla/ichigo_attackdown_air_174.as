// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_attackdown_air_174

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.geom.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class ichigo_attackdown_air_174 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;

        public function ichigo_attackdown_air_174()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 7, this.frame8, 8, this.frame9, 11, this.frame12, 22, this.frame23, 24, this.frame25, 25, this.frame26, 31, this.frame32);
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
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.landingLag(false);
            };
        }

        internal function frame4():*
        {
            this.landingLag(true);
        }

        internal function frame8():*
        {
            this.playsound = SSF2API.random();
            if (((this.playsound > 0) && (this.playsound <= 0.25)))
            {
                this.self.playAttackSound(1);
            };
            if (((this.playsound > 0.25) && (this.playsound <= 0.5)))
            {
                this.self.playAttackSound(2);
            };
            if (((this.playsound > 0.5) && (this.playsound <= 0.75)))
            {
                this.self.playAttackSound(3);
            };
            if (((this.playsound > 0.75) && (this.playsound <= 1)))
            {
                this.self.playAttackSound(4);
            };
        }

        internal function frame9():*
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

        internal function frame12():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":12,
                "direction":90
            });
        }

        internal function frame23():*
        {
            this.landingLag(false);
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }

        internal function frame26():*
        {
            this.self.updateAttackStats({"cancelWhenAirborne":true});
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

