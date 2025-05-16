// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.Peach_Taunt_123

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

    public dynamic class Peach_Taunt_123 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;

        public function Peach_Taunt_123()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 17, this.frame18, 18, this.frame19, 59, this.frame60, 60, this.frame61, 91, this.frame92);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame3():*
        {
            SSF2API.playSound("peach_hi");
        }

        internal function frame18():*
        {
            this.self.endAttack();
        }

        internal function frame19():*
        {
            SSF2API.playSound("peach_lalala");
        }

        internal function frame60():*
        {
            this.self.endAttack();
        }

        internal function frame61():*
        {
            SSF2API.playSound("peach_sweet");
        }

        internal function frame92():*
        {
            this.self.endAttack();
        }


    }
}//package peach_fla

