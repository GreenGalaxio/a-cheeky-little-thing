// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.Peach_Revivalplatform_11

package peach_fla
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

    public dynamic class Peach_Revivalplatform_11 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var stance:MovieClip;
        public var self:*;

        public function Peach_Revivalplatform_11()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 17, this.frame18, 30, this.frame31);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame2():*
        {
            SSF2API.playSound("peach_entrance_sfx");
        }

        internal function frame18():*
        {
            SSF2API.playSound("peach_hi", true);
        }

        internal function frame31():*
        {
            this.self.endAttack();
        }


    }
}//package peach_fla

