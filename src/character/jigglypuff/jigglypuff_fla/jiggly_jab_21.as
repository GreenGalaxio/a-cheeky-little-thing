// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jiggly_jab_21

package jigglypuff_fla
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

    public dynamic class jiggly_jab_21 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var released1:Boolean;
        public var pressed2:Boolean;
        public var hasHit:Boolean;
        public var controls:Object;
        public var continuePlaying:Boolean;
        public var handled:Boolean;

        public function jiggly_jab_21()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 13, this.frame14, 19, this.frame20);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.released1 = false;
                this.pressed2 = false;
                this.hasHit = false;
                this.controls = this.self.getControls();
            };
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame2():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                this.released1 = true;
            };
            this.self.refreshAttackID();
        }

        internal function frame3():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                this.released1 = true;
            };
        }

        internal function frame4():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                this.released1 = true;
            };
            this.self.playAttackSound(1);
        }

        internal function frame5():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                this.released1 = true;
            };
        }

        internal function frame6():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                this.released1 = true;
            };
        }

        internal function frame7():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                this.released1 = true;
            };
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame8():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON2)
            {
                this.released1 = true;
            };
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
            if (!this.released1)
            {
                gotoAndPlay("combo1");
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
            if (this.continuePlaying != true)
            {
                this.self.endAttack();
            };
        }

        internal function frame11():*
        {
            this.continuePlaying = false;
            this.handled = false;
            this.hasHit = true;
        }

        internal function frame12():*
        {
            this.self.refreshAttackID();
        }

        internal function frame14():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame20():*
        {
            this.self.endAttack();
        }


    }
}//package jigglypuff_fla

