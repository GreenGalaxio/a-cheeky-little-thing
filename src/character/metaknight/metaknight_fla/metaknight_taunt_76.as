// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_taunt_76

package metaknight_fla
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

    public dynamic class metaknight_taunt_76 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function metaknight_taunt_76()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 10, this.frame11, 30, this.frame31, 46, this.frame47, 51, this.frame52, 73, this.frame74, 77, this.frame78, 112, this.frame113, 113, this.frame114, 155, this.frame156);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame5():*
        {
            SSF2API.playSound("mk_jump2");
        }

        internal function frame11():*
        {
            SSF2API.playSound("mk_taunt");
        }

        internal function frame31():*
        {
            SSF2API.playSound("mk_jump2");
        }

        internal function frame47():*
        {
            this.self.endAttack();
        }

        internal function frame52():*
        {
            SSF2API.playSound("mk_taunt2");
        }

        internal function frame74():*
        {
            SSF2API.playSound("mk_slash_s");
        }

        internal function frame78():*
        {
            SSF2API.playSound("mk_slash_m");
        }

        internal function frame113():*
        {
            this.self.endAttack();
        }

        internal function frame114():*
        {
        }

        internal function frame156():*
        {
            this.self.endAttack();
        }


    }
}//package metaknight_fla

