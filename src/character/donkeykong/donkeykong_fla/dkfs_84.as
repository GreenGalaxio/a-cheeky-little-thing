// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.dkfs_84

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

    public dynamic class dkfs_84 extends MovieClip 
    {

        public var self:*;
        public var canTarget:Boolean;
        public var canShoot:Boolean;

        public function dkfs_84()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 19, this.frame20, 37, this.frame38, 38, this.frame39, 58, this.frame59, 59, this.frame60, 63, this.frame64, 64, this.frame65, 73, this.frame74, 84, this.frame85, 85, this.frame86, 96, this.frame97);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                SSF2API.playSound("arcadeintro");
            };
        }

        internal function frame5():*
        {
            SSF2API.playSound("arcade_jump");
        }

        internal function frame20():*
        {
            this.canTarget = false;
            this.canShoot = false;
            this.visible = false;
        }

        internal function frame38():*
        {
            SSF2API.playSound("Barrel_jumped_over");
        }

        internal function frame39():*
        {
            this.canTarget = true;
            this.canShoot = true;
        }

        internal function frame59():*
        {
            this.gotoAndPlay("idle");
        }

        internal function frame60():*
        {
            SSF2API.playSound("Barrel_jumped_over");
        }

        internal function frame64():*
        {
            this.gotoAndPlay("idle");
        }

        internal function frame65():*
        {
            this.canTarget = false;
            this.canShoot = false;
        }

        internal function frame74():*
        {
            SSF2API.playSound("dkdash");
        }

        internal function frame85():*
        {
            this.gotoAndPlay("getBarrel");
        }

        internal function frame86():*
        {
            this.canTarget = false;
            this.canShoot = false;
            this.visible = true;
            SSF2API.playSound("arcade_dead");
        }

        internal function frame97():*
        {
            this.self.endAttack();
        }


    }
}//package donkeykong_fla

