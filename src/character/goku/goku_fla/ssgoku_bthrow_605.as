// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.ssgoku_bthrow_605

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

    public dynamic class ssgoku_bthrow_605 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function ssgoku_bthrow_605()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 6, this.frame7, 10, this.frame11, 14, this.frame15, 18, this.frame19, 22, this.frame23, 26, this.frame27, 30, this.frame31, 34, this.frame35, 38, this.frame39, 42, this.frame43, 43, this.frame44);
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

        internal function frame7():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame11():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame15():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame19():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame23():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame27():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame31():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame35():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame39():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame43():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
        }

        internal function frame44():*
        {
            this.self.flip();
            this.self.endAttack();
        }


    }
}//package goku_fla

