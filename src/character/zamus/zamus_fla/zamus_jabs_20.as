// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zamus_fla.zamus_jabs_20

package zamus_fla
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

    public dynamic class zamus_jabs_20 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var continuePlaying:Boolean;
        public var handled:Boolean;
        public var restart:Boolean;

        public function zamus_jabs_20()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 8, this.frame9, 9, this.frame10, 10, this.frame11, 12, this.frame13, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 31, this.frame32);
        }

        public function jabCheck():void
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        public function jabCheck2():void
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo3");
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.playAttackSound(1);
                this.self.setGlobalVariable("tether", false);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
            this.continuePlaying = false;
            this.handled = true;
            this.restart = false;
        }

        internal function frame4():*
        {
            this.continuePlaying = false;
            this.handled = false;
            SSF2API.createTimer(this.self, 1, 7, this.jabCheck);
        }

        internal function frame9():*
        {
            if (((!(this.continuePlaying == true)) && (!(this.restart))))
            {
                this.self.endAttack();
            }
            else
            {
                if (this.restart)
                {
                    gotoAndPlay("combo1");
                };
            };
        }

        internal function frame10():*
        {
            this.self.refreshAttackID();
            SSF2API.destroyTimer(this.self, this.jabCheck);
            this.self.updateAttackBoxStats(1, {"direction":50});
            this.continuePlaying = false;
            this.handled = true;
        }

        internal function frame11():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame13():*
        {
            this.continuePlaying = false;
            this.handled = false;
            SSF2API.createTimer(this.self, 1, 7, this.jabCheck2);
        }

        internal function frame19():*
        {
            if (this.continuePlaying != true)
            {
                this.self.endAttack();
            };
        }

        internal function frame20():*
        {
            this.self.refreshAttackID();
            SSF2API.destroyTimer(this.self, this.jabCheck2);
            this.self.updateAttackBoxStats(1, {
                "direction":50,
                "power":55,
                "hitStun":4
            });
        }

        internal function frame21():*
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

        internal function frame22():*
        {
            this.self.playAttackSound(3);
            this.self.setXSpeed(4, false);
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }


    }
}//package zamus_fla

