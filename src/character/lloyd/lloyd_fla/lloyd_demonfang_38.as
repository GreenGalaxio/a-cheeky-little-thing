// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_demonfang_38

package lloyd_fla
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

    public dynamic class lloyd_demonfang_38 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;
        public var xframe:*;
        public var controls:Object;
        public var fangPressed:Boolean;
        public var doubleTrue:Boolean;
        public var onground:Boolean;
        public var rand:*;
        public var lvl:int;

        public function lloyd_demonfang_38()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 4, this.frame5, 7, this.frame8, 8, this.frame9, 19, this.frame20, 20, this.frame21, 29, this.frame30, 30, this.frame31, 39, this.frame40);
        }

        public function doubleFangCheck():void
        {
            this.controls = this.self.getControls();
            if (((!(this.controls.BUTTON1)) && (this.fangPressed)))
            {
                this.fangPressed = false;
            }
            else
            {
                if (((this.controls.BUTTON1) && (!(this.fangPressed))))
                {
                    this.fangPressed = true;
                    this.doubleTrue = true;
                };
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.controls = null;
            this.fangPressed = true;
            this.doubleTrue = false;
            this.onground = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.onground = this.self.isOnGround();
                SSF2API.createTimer(this.self, 1, -1, this.doubleFangCheck);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.rand = 0;
            };
        }

        internal function frame2():*
        {
            this.lvl = 0;
            if (this.self.isCPU())
            {
                this.lvl = this.self.getCPULevel();
                this.rand = (10 * SSF2API.random());
                if ((((this.lvl > 5) && (this.rand >= 2)) && (this.rand < 4)))
                {
                    this.self.importCPUControls([128, 3, 64, 1]);
                    this.self.endAttack();
                };
                if (((this.lvl > 5) && (this.rand >= 4)))
                {
                    this.self.importCPUControls([128, 1, 0, 2, 64, 1]);
                    this.self.endAttack();
                };
            };
        }

        internal function frame5():*
        {
            this.xframe = "attack";
        }

        internal function frame8():*
        {
            SSF2API.destroyTimer(this.self, this.doubleFangCheck);
            this.self.playAttackSound(2);
            if (this.doubleTrue == true)
            {
                this.self.playVoiceSound(1);
            }
            else
            {
                this.self.playVoiceSound(2);
            };
        }

        internal function frame9():*
        {
            this.self.fireProjectile("demonfang");
            if (this.doubleTrue == true)
            {
                gotoAndPlay("attack2");
            };
        }

        internal function frame20():*
        {
            this.self.endAttack();
        }

        internal function frame21():*
        {
            this.xframe = "attack2";
        }

        internal function frame30():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame31():*
        {
            this.self.fireProjectile("demonfang");
        }

        internal function frame40():*
        {
            this.self.endAttack();
        }


    }
}//package lloyd_fla

