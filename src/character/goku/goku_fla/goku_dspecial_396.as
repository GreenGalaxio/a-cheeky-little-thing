// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.goku_dspecial_396

package goku_fla
{
    import flash.display.MovieClip;
    import flash.events.Event;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class goku_dspecial_396 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var hasHit:Boolean;
        public var controls:Object;

        public function goku_dspecial_396()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 7, this.frame8, 19, this.frame20, 20, this.frame21, 22, this.frame23);
        }

        public function toKaioken(_arg_1:Event=null):void
        {
            gotoAndPlay("afterHit");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.hasHit = false;
                this.controls = this.self.getControls();
                this.self.addEventListener(SSF2Event.ATTACK_CONNECT, this.toKaioken);
            };
        }

        internal function frame2():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame8():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame20():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                gotoAndPlay("loop");
            };
        }

        internal function frame21():*
        {
            this.controls = this.self.endAttack();
        }

        internal function frame23():*
        {
            this.self.replaceCharacter("goku_kk", "b_down", "end");
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }


    }
}//package goku_fla

