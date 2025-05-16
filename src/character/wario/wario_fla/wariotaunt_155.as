// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.wariotaunt_155

package wario_fla
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

    public dynamic class wariotaunt_155 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function wariotaunt_155()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 31, this.frame32, 35, this.frame36, 66, this.frame67, 74, this.frame75, 77, this.frame78, 81, this.frame82, 85, this.frame86, 89, this.frame90, 101, this.frame102);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame3():*
        {
            SSF2API.playSound("wariotaunt");
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }

        internal function frame36():*
        {
            SSF2API.playSound("wario_taunt2");
        }

        internal function frame67():*
        {
            this.self.endAttack();
        }

        internal function frame75():*
        {
            SSF2API.playSound("wario_taunt3");
        }

        internal function frame78():*
        {
            SSF2API.playSound("brawl_wario_swing_M");
        }

        internal function frame82():*
        {
            SSF2API.playSound("brawl_wario_swing_M");
        }

        internal function frame86():*
        {
            SSF2API.playSound("brawl_wario_swing_M");
        }

        internal function frame90():*
        {
            SSF2API.playSound("brawl_wario_swing_M");
        }

        internal function frame102():*
        {
            this.self.endAttack();
        }


    }
}//package wario_fla

