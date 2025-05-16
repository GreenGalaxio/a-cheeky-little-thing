// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jiggly_uair_63

package jigglypuff_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class jiggly_uair_63 extends MovieClip 
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
        public var getTarget:Object;
        public var lvl:int;

        public function jiggly_uair_63()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 13, this.frame14, 14, this.frame15, 18, this.frame19);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
            this.getTarget = null;
            this.lvl = 0;
            if (((((parent) && (SSF2API.isReady())) && (this.self)) && (this.self.isCPU())))
            {
                if (((this.self.getCPUForcedAction() == -1) || (this.self.getCPUForcedAction() == 5)))
                {
                    this.getTarget = this.self.getCPUTarget();
                    this.lvl = this.self.getCPULevel();
                    if ((((((((((((((this.lvl == 9) && (SSF2API.random() < 0.4)) && (!(this.self.getCPUTarget().getMC().currentLabel == "defend"))) && (!(this.self.getCPUTarget().getMC().currentLabel == "airdodge"))) && (!(this.self.getCPUTarget().getMC().currentLabel == "revival"))) && (!(this.self.inUpperRightWarningBounds()))) && (!(this.self.inLowerRightWarningBounds()))) && (!(this.self.inUpperLeftWarningBounds()))) && (!(this.self.inLowerLeftWarningBounds()))) && (this.getTarget.getX() < (parent.x + 15))) && (this.getTarget.getX() > (parent.x - 15))) && (this.getTarget.getY() < (parent.y + 25))) && ((this.getTarget.getY() + 15) > (parent.y + 25))))
                    {
                        this.self.importCPUControls([1088, 2]);
                        SSF2API.print("from uair");
                        this.self.endAttack();
                    };
                };
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            };
        }

        internal function frame4():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
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

        internal function frame14():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame15():*
        {
            this.self.endAttack();
        }

        internal function frame19():*
        {
            this.self.endAttack();
        }


    }
}//package jigglypuff_fla

