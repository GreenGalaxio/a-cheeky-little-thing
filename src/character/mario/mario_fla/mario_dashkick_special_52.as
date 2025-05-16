// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_dashkick_special_52

package mario_fla
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

    public dynamic class mario_dashkick_special_52 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function mario_dashkick_special_52()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 19, this.frame20, 26, this.frame27);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setXSpeed(21, false);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.playSound("mario_hurt2");
            };
        }

        internal function frame6():*
        {
            SSF2API.playSound("special_dash_fire");
        }

        internal function frame20():*
        {
            SSF2API.playSound("mario_charge");
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla

