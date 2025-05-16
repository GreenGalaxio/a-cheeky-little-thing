// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_taunt_190

package sonic_fla
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

    public dynamic class sonic_taunt_190 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;

        public function sonic_taunt_190()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 10, this.frame11, 17, this.frame18, 23, this.frame24, 29, this.frame30, 36, this.frame37, 46, this.frame47, 47, this.frame48, 50, this.frame51, 57, this.frame58, 59, this.frame60, 71, this.frame72, 73, this.frame74, 91, this.frame92, 102, this.frame103);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame6():*
        {
            SSF2API.playSound("sonic_rev");
            SSF2API.playSound("too_slow");
        }

        internal function frame11():*
        {
            SSF2API.playSound("sonic_rev");
        }

        internal function frame18():*
        {
            SSF2API.playSound("sonic_rev");
        }

        internal function frame24():*
        {
            SSF2API.playSound("sonic_rev");
        }

        internal function frame30():*
        {
            SSF2API.playSound("sonic_rev");
        }

        internal function frame37():*
        {
            SSF2API.playSound("sonic_rev");
        }

        internal function frame47():*
        {
            this.self.endAttack();
        }

        internal function frame48():*
        {
            SSF2API.playSound("step_it_up");
        }

        internal function frame51():*
        {
            this.self.playGlobalSound("whoosh4");
        }

        internal function frame58():*
        {
            this.self.playGlobalSound("whoosh4");
        }

        internal function frame60():*
        {
            this.self.playGlobalSound("whoosh4");
        }

        internal function frame72():*
        {
            this.self.endAttack();
        }

        internal function frame74():*
        {
            SSF2API.playSound("snd_se_Sonic_008");
        }

        internal function frame92():*
        {
        }

        internal function frame103():*
        {
            this.self.endAttack();
        }


    }
}//package sonic_fla

