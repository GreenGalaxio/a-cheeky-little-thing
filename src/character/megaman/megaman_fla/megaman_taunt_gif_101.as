// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_taunt_gif_101

package megaman_fla
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

    public dynamic class megaman_taunt_gif_101 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;

        public function megaman_taunt_gif_101()
        {
            addFrameScript(0, this.frame1, 50, this.frame51, 51, this.frame52, 77, this.frame78, 78, this.frame79, 100, this.frame101, 105, this.frame106);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame51():*
        {
            this.self.endAttack();
        }

        internal function frame52():*
        {
            SSF2API.playSound("mmtaunt2");
        }

        internal function frame78():*
        {
            this.self.endAttack();
        }

        internal function frame79():*
        {
            SSF2API.playSound("megaman_switch");
        }

        internal function frame101():*
        {
            SSF2API.playSound("megaman_zap");
        }

        internal function frame106():*
        {
            this.self.endAttack();
        }


    }
}//package megaman_fla

