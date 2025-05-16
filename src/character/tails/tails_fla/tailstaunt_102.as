// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tailstaunt_102

package tails_fla
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

    public dynamic class tailstaunt_102 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function tailstaunt_102()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 17, this.frame18, 25, this.frame26, 50, this.frame51);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame2():*
        {
            SSF2API.playSound("tails_taunt2");
        }

        internal function frame18():*
        {
            this.self.endAttack();
        }

        internal function frame26():*
        {
            SSF2API.playSound("tails_taunt");
        }

        internal function frame51():*
        {
            this.self.endAttack();
        }


    }
}//package tails_fla

