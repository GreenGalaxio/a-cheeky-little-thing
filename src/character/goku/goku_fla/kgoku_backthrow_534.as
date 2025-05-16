// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.kgoku_backthrow_534

package goku_fla
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

    public dynamic class kgoku_backthrow_534 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function kgoku_backthrow_534()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 5, this.frame6, 8, this.frame9, 11, this.frame12, 13, this.frame14, 15, this.frame16, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
            };
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame6():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame9():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame12():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame14():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame16():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame19():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame20():*
        {
            SSF2API.shakeCamera(9);
        }

        internal function frame21():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
        }

        internal function frame22():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

