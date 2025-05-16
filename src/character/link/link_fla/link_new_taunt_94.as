// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_new_taunt_94

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

    public dynamic class link_new_taunt_94 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;

        public function link_new_taunt_94()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 13, this.frame14, 30, this.frame31, 79, this.frame80);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame10():*
        {
            SSF2API.playSound("link_jump");
        }

        internal function frame14():*
        {
            SSF2API.playSound("link_taunt_ching");
        }

        internal function frame31():*
        {
            this.self.endAttack();
        }

        internal function frame80():*
        {
            this.self.endAttack();
        }


    }
}//package link_fla

