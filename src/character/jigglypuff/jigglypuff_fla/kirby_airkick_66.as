// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.kirby_airkick_66

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

    public dynamic class kirby_airkick_66 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var getTarget:Object;
        public var lvl:int;

        public function kirby_airkick_66()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 11, this.frame12, 12, this.frame13, 14, this.frame15, 15, this.frame16, 19, this.frame20, 24, this.frame25, 31, this.frame32);
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
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            };
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame4():*
        {
            this.self.refreshAttackID();
        }

        internal function frame5():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame6():*
        {
            this.self.refreshAttackID();
        }

        internal function frame7():*
        {
            this.self.refreshAttackID();
        }

        internal function frame8():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame9():*
        {
            this.self.refreshAttackID();
        }

        internal function frame10():*
        {
            this.self.refreshAttackID();
        }

        internal function frame12():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame13():*
        {
            this.self.refreshAttackID();
        }

        internal function frame15():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame16():*
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

        internal function frame20():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame25():*
        {
            this.getTarget = null;
            this.lvl = 0;
            if (((((parent) && (SSF2API.isReady())) && (this.self)) && (this.self.isCPU())))
            {
                if (((this.self.getCPUForcedAction() == -1) || (this.self.getCPUForcedAction() == 5)))
                {
                    this.getTarget = this.self.getCPUTarget();
                    this.lvl = this.self.getCPULevel();
                    if (((((((this.lvl == 9) && (SSF2API.random() < 0.1)) && (this.getTarget.getX() < (parent.x + 30))) && (this.getTarget.getX() > (parent.x - 30))) && (this.getTarget.getY() < (parent.y + 30))) && ((this.getTarget.getY() + 30) > parent.y)))
                    {
                        this.self.importCPUControls([1088, 1]);
                        SSF2API.print("from dair");
                    };
                };
            };
            this.self.endAttack();
        }

        internal function frame32():*
        {
            if (((((parent) && (SSF2API.isReady())) && (this.self)) && (this.self.isCPU())))
            {
                this.getTarget = this.self.getCPUTarget();
                this.lvl = this.self.getCPULevel();
                if ((((((((this.lvl == 9) && ((this.getTarget.getCurrentAttackFrame() == "hurt") && (this.getTarget.getCurrentAttackFrame() == "falling"))) && (SSF2API.random() < 0.5)) && (this.getTarget.getX() < (parent.x + 30))) && (this.getTarget.getX() > (parent.x - 30))) && (this.getTarget.getY() < (parent.y + 30))) && ((this.getTarget.getY() + 30) > parent.y)))
                {
                    this.self.importCPUControls([0x0800, 1, 0, 2, 1088, 1]);
                    SSF2API.print("from dair land");
                };
            };
            this.self.endAttack();
        }


    }
}//package jigglypuff_fla

