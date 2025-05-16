// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_fs_startup_81

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.media.*;
    import flash.geom.*;
    import flash.events.*;
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

    public dynamic class chibi_fs_startup_81 extends MovieClip 
    {

        public var self:*;

        public function chibi_fs_startup_81()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 17, this.frame18, 20, this.frame21);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame7():*
        {
            this.self.fireProjectile("gigarobo", this.self.getX(), SSF2API.getCamBounds().y, true);
            this.self.playAttackSound(1);
        }

        internal function frame18():*
        {
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }


    }
}//package chibirobo_fla

