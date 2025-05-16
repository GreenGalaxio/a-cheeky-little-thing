// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_tech_ground_81

package bomberman_fla
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

    public dynamic class Bomberman_tech_ground_81 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function Bomberman_tech_ground_81()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 12, this.frame13);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((SSF2API.isReady()) && (parent)) && (this.self)))
            {
                this.self.setIntangibility(true);
            };
        }

        internal function frame10():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame13():*
        {
            this.self.endAttack();
        }


    }
}//package bomberman_fla

