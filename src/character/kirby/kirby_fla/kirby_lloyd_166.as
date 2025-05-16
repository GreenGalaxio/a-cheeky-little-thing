// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_lloyd_166

package kirby_fla
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

    public dynamic class kirby_lloyd_166 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var controls:Object;
        public var fangPressed:Boolean;
        public var doubleTrue:Boolean;
        public var onground:Boolean;

        public function kirby_lloyd_166()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 7, this.frame8, 8, this.frame9, 19, this.frame20, 20, this.frame21, 29, this.frame30, 30, this.frame31, 39, this.frame40);
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
        }

        internal function frame5():*
        {
            this.xframe = "attack";
        }

        internal function frame8():*
        {
            SSF2API.destroyTimer(this.self, this.doubleFangCheck);
            this.self.playAttackSound(2);
            this.self.playVoiceSound(1);
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
            this.self.playVoiceSound(2);
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
}//package kirby_fla

