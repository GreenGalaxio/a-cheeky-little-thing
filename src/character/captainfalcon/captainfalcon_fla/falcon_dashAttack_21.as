// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_dashAttack_21

package captainfalcon_fla
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

    public dynamic class falcon_dashAttack_21 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;

        public function falcon_dashAttack_21()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 3, this.frame4, 5, this.frame6, 16, this.frame17);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame2():*
        {
            this.playsound = SSF2API.random();
            this.audio = this.self.getGlobalVariable("audio");
        }

        internal function frame4():*
        {
            if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
            {
                if (((!(root == null)) && (!(parent == null))))
                {
                    this.self.playVoiceSound(1);
                };
                if (((!(root == null)) && (!(parent == null))))
                {
                    this.self.setGlobalVariable("audio", 1);
                };
            };
            if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
            {
                if (((!(root == null)) && (!(parent == null))))
                {
                    this.self.playVoiceSound(2);
                };
                if (((!(root == null)) && (!(parent == null))))
                {
                    this.self.setGlobalVariable("audio", 2);
                };
            };
            if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
            {
                if (((!(root == null)) && (!(parent == null))))
                {
                    this.self.playVoiceSound(3);
                };
                if (((!(root == null)) && (!(parent == null))))
                {
                    this.self.setGlobalVariable("audio", 3);
                };
            };
            if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
            {
                if (((!(root == null)) && (!(parent == null))))
                {
                    this.self.playVoiceSound(4);
                };
                if (((!(root == null)) && (!(parent == null))))
                {
                    this.self.setGlobalVariable("audio", 4);
                };
            };
            if (((!(root == null)) && (!(parent == null))))
            {
                this.self.playAttackSound(1);
            };
            if (((!(root == null)) && (!(parent == null))))
            {
                this.self.setXSpeed(17, false);
            };
        }

        internal function frame6():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":8,
                "power":10,
                "kbConstant":50
            });
        }

        internal function frame17():*
        {
            this.self.endAttack();
        }


    }
}//package captainfalcon_fla

