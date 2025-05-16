// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_new_grab_74

package link_fla
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

    public dynamic class link_new_grab_74 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var pummeled:Boolean;
        public var landing:Boolean;

        public function link_new_grab_74()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 4, this.frame5, 7, this.frame8, 28, this.frame29, 29, this.frame30, 33, this.frame34, 34, this.frame35, 35, this.frame36, 43, this.frame44, 44, this.frame45, 45, this.frame46);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "grab";
            this.pummeled = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("nStoredLabel", null);
                this.self.setGlobalVariable("sStoredLabel", null);
            };
        }

        internal function frame4():*
        {
        }

        internal function frame5():*
        {
        }

        internal function frame8():*
        {
            SSF2API.playSound("link_hookshot");
        }

        internal function frame29():*
        {
            this.self.endAttack();
        }

        internal function frame30():*
        {
            this.xframe = "grab";
            if (this.pummeled)
            {
                gotoAndPlay("loop");
            };
        }

        internal function frame34():*
        {
            this.self.swapDepthsWithGrabbedOpponent(false);
        }

        internal function frame35():*
        {
            gotoAndStop("loop");
        }

        internal function frame36():*
        {
            this.xframe = "attack";
            this.pummeled = true;
        }

        internal function frame44():*
        {
            this.gotoAndStop("grabbed");
        }

        internal function frame45():*
        {
            this.landing = this.self.isOnGround();
            this.self.setGlobalVariable("tether", true);
            this.self.updateAttackStats({"allowControl":true});
            if (this.landing)
            {
                gotoAndPlay("land0");
            };
        }

        internal function frame46():*
        {
            this.self.forceAttack("tether");
        }


    }
}//package link_fla

