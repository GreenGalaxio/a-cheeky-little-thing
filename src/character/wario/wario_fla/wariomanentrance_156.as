// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.wariomanentrance_156

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

    public dynamic class wariomanentrance_156 extends MovieClip 
    {

        public var self:*;
        public var finished:Boolean;

        public function wariomanentrance_156()
        {
            addFrameScript(0, this.frame1, 12, this.frame13, 27, this.frame28, 46, this.frame47, 47, this.frame48);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.finished = false;
        }

        internal function frame13():*
        {
            SSF2API.getCharacter(this).playAttackSound(1);
        }

        internal function frame28():*
        {
            SSF2API.getCharacter(this).playAttackSound(2);
        }

        internal function frame47():*
        {
            this.finished = true;
            SSF2API.getCharacter(this).activateFinalForm();
            stop();
        }

        internal function frame48():*
        {
            this.gotoAndStop("stopped");
        }


    }
}//package wario_fla

