// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.Kirby_Taunt_89

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class Kirby_Taunt_89 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;

        public function Kirby_Taunt_89()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 30, this.frame31);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("kirbyPeachUsed", true);
            };
        }

        internal function frame2():*
        {
            SSF2API.playSound("kirby_taunt_brawl");
        }

        internal function frame31():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

