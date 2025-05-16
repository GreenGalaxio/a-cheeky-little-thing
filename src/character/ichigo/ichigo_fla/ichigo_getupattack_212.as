// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_getupattack_212

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.geom.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class ichigo_getupattack_212 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var ready:*;

        public function ichigo_getupattack_212()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 7, this.frame8, 8, this.frame9, 19, this.frame20, 22, this.frame23);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.ready = false;
        }

        internal function frame7():*
        {
            stop();
            this.ready = true;
        }

        internal function frame8():*
        {
            gotoAndStop("dead");
        }

        internal function frame9():*
        {
            if (!this.self.isForcedCrash())
            {
                this.self.setIntangibility(true);
            };
        }

        internal function frame20():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame23():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

