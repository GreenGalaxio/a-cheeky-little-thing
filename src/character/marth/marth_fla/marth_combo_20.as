// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_combo_20

package marth_fla
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

    public dynamic class marth_combo_20 extends MovieClip 
    {

        public var attackBox4:MovieClip;
        public var attackBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox:MovieClip;
        public var attackBox3:MovieClip;
        public var attackBox2:MovieClip;
        public var self:*;
        public var continuePlaying:Boolean;
        public var handled:Boolean;

        public function marth_combo_20()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 6, this.frame7, 10, this.frame11, 13, this.frame14, 16, this.frame17, 18, this.frame19, 22, this.frame23, 25, this.frame26);
        }

        public function checkForGoToJab2():*
        {
            if (this.continuePlaying == true)
            {
                SSF2API.destroyTimer(this.self, this.checkForGoToJab2);
                this.self.refreshAttackID();
                gotoAndPlay("jab2");
            };
        }

        public function checkForGoToJab1():*
        {
            if (this.continuePlaying == true)
            {
                SSF2API.destroyTimer(this.self, this.checkForGoToJab1);
                this.self.refreshAttackID();
                gotoAndPlay("jab1");
            };
        }

        public function playSound(_arg_1:int, _arg_2:int):*
        {
            var _local_3:* = (Math.floor((SSF2API.random() * ((_arg_2 - _arg_1) + 1))) + _arg_1);
            this.self.playAttackSound(_local_3);
        }

        public function playVoice(_arg_1:int, _arg_2:int):*
        {
            var _local_3:* = (Math.floor((SSF2API.random() * (_arg_2 - _arg_1))) + _arg_1);
            if (_local_3 >= 1)
            {
                this.self.playVoiceSound(_local_3);
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.continuePlaying = false;
            this.handled = true;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("sideBCheck", 0);
            };
        }

        internal function frame5():*
        {
            this.playVoice(0, 4);
            this.self.playAttackSound(1);
        }

        internal function frame7():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame11():*
        {
            SSF2API.createTimer(this.self, 1, 5, this.checkForGoToJab2);
        }

        internal function frame14():*
        {
            this.self.endAttack();
        }

        internal function frame17():*
        {
            this.playVoice(0, 4);
            this.self.playAttackSound(2);
        }

        internal function frame19():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame23():*
        {
            SSF2API.createTimer(this.self, 1, 5, this.checkForGoToJab1);
        }

        internal function frame26():*
        {
            this.self.endAttack();
        }


    }
}//package marth_fla

