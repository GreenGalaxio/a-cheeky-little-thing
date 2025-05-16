// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jiggly_tech_roll_111

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

    public dynamic class jiggly_tech_roll_111 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function jiggly_tech_roll_111()
        {
            addFrameScript(0, this.frame1, 10, this.frame11, 19, this.frame20);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setIntangibility(true);
            };
        }

        internal function frame11():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame20():*
        {
            this.self.endAttack();
        }


    }
}//package jigglypuff_fla

