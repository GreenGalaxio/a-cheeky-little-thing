// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_new_jab_31

package link_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class link_new_jab_31 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var continuePlaying:Boolean;
        public var handled:Boolean;

        public function link_new_jab_31()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 15, this.frame16, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 28, this.frame29, 39, this.frame40);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
            this.continuePlaying = false;
            this.handled = true;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("nStoredLabel", null);
                this.self.setGlobalVariable("sStoredLabel", null);
            };
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
            this.continuePlaying = false;
            this.handled = false;
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
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame12():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame13():*
        {
            if (this.continuePlaying != true)
            {
                this.self.endAttack();
            };
        }

        internal function frame14():*
        {
            this.continuePlaying = false;
            this.handled = true;
            this.self.setGlobalVariable("jab", 1);
            this.self.updateAttackBoxStats(1, {
                "damage":3,
                "direction":110,
                "power":40,
                "kbConstant":20
            });
            this.self.refreshAttackID();
        }

        internal function frame16():*
        {
            this.self.playAttackSound(2);
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame19():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo3");
            };
        }

        internal function frame20():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo3");
            };
        }

        internal function frame21():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo3");
            };
        }

        internal function frame22():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo3");
            };
        }

        internal function frame23():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo3");
            };
        }

        internal function frame24():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo3");
            };
        }

        internal function frame25():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo3");
            };
        }

        internal function frame26():*
        {
            if (this.continuePlaying != true)
            {
                this.self.endAttack();
            };
        }

        internal function frame27():*
        {
            this.self.setGlobalVariable("jab", 0);
            this.self.updateAttackBoxStats(1, {
                "damage":5,
                "direction":30,
                "power":40,
                "kbConstant":90
            });
            this.self.refreshAttackID();
        }

        internal function frame29():*
        {
            this.self.playAttackSound(3);
            this.self.updateAttackBoxStats(1, {"effectSound":"sw_brawl_hit_M"});
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

        internal function frame40():*
        {
            this.self.endAttack();
        }


    }
}//package link_fla

