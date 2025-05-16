// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_taunt_93

package lloyd_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class lloyd_taunt_93 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function lloyd_taunt_93()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 35, this.frame36, 47, this.frame48, 65, this.frame66);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame3():*
        {
            SSF2API.playSound("lloyd_pieceofcake");
        }

        internal function frame36():*
        {
            this.self.endAttack();
        }

        internal function frame48():*
        {
            SSF2API.playSound("lloyd_taunt2");
        }

        internal function frame66():*
        {
            this.self.endAttack();
        }


    }
}//package lloyd_fla

