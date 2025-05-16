// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zamus_fla.zamus_taunt_77

package zamus_fla
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

    public dynamic class zamus_taunt_77 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function zamus_taunt_77()
        {
            addFrameScript(0, this.frame1, 13, this.frame14, 33, this.frame34, 51, this.frame52);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame14():*
        {
            SSF2API.playSound("zamus_usmash");
        }

        internal function frame34():*
        {
            SSF2API.playSound("zamus_grab");
            SSF2API.playSound("zamus_youreMine", true);
        }

        internal function frame52():*
        {
            this.self.endAttack();
        }


    }
}//package zamus_fla

