// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_taunt_150

package captainfalcon_fla
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

    public dynamic class falcon_taunt_150 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;

        public function falcon_taunt_150()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 16, this.frame17, 32, this.frame33);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame3():*
        {
            SSF2API.playSound("falcon_taunt1");
        }

        internal function frame17():*
        {
            SSF2API.playSound("falcon_aswing");
        }

        internal function frame33():*
        {
            this.self.endAttack();
        }


    }
}//package captainfalcon_fla

