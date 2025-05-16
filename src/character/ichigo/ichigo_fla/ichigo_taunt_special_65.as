// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_taunt_special_65

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.geom.*;
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

    public dynamic class ichigo_taunt_special_65 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function ichigo_taunt_special_65()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 36, this.frame37, 81, this.frame82);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame2():*
        {
            SSF2API.playSound("ichigo_taunt");
        }

        internal function frame37():*
        {
            this.self.endAttack();
        }

        internal function frame82():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

