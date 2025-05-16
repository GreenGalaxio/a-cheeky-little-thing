// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.dkentrance_11

package donkeykong_fla
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

    public dynamic class dkentrance_11 extends MovieClip 
    {

        public var self:*;
        public var facing:Boolean;

        public function dkentrance_11()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 18, this.frame19, 20, this.frame21, 36, this.frame37);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame2():*
        {
            this.facing = this.self.isFacingRight();
            this.self.faceRight();
        }

        internal function frame19():*
        {
            SSF2API.playSound("dk_entrance_sfx");
            SSF2API.playSound("dk_entrance_vfx");
        }

        internal function frame21():*
        {
            if (!this.facing)
            {
                this.self.faceLeft();
            };
        }

        internal function frame37():*
        {
            this.self.endAttack();
        }


    }
}//package donkeykong_fla

