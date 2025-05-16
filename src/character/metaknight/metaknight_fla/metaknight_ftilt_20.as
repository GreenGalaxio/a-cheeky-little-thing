// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_ftilt_20

package metaknight_fla
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

    public dynamic class metaknight_ftilt_20 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var continuePlaying:Boolean;
        public var handled:Boolean;
        public var playsound:Number;
        public var audio:Number;

        public function metaknight_ftilt_20()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 31, this.frame32);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.continuePlaying = false;
            this.handled = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame2():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame5():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame6():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame7():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame8():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame9():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame10():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame11():*
        {
            if (this.continuePlaying != true)
            {
                this.self.endAttack();
            };
        }

        internal function frame12():*
        {
            this.continuePlaying = false;
            this.handled = false;
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "damage":3,
                "power":14,
                "kbConstant":88,
                "direction":155
            });
            this.self.playAttackSound(1);
        }

        internal function frame15():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo3");
            };
        }

        internal function frame16():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo3");
            };
        }

        internal function frame17():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo3");
            };
        }

        internal function frame18():*
        {
            if (this.continuePlaying != true)
            {
                this.self.endAttack();
            };
        }

        internal function frame19():*
        {
            this.continuePlaying = false;
            this.handled = false;
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "damage":7,
                "power":50,
                "kbConstant":90,
                "direction":40,
                "hitLag":-0.95
            });
            this.self.playAttackSound(3);
            this.playsound = SSF2API.random();
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

        internal function frame32():*
        {
            this.self.endAttack();
        }


    }
}//package metaknight_fla

