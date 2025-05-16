// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_insideTetherChecker_141

package link_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class link_insideTetherChecker_141 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var character:*;
        public var self:*;

        public function link_insideTetherChecker_141()
        {
            addFrameScript(0, this.frame1, 5, this.frame6);
        }

        public function toContinue():void
        {
            SSF2API.print("hello friends");
            this.character.endAttack("hang");
            this.character.setX(this.self.getX());
            this.character.setY(this.self.getY());
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
            this.self.destroy();
        }

        internal function frame1():*
        {
            this.character = null;
            this.self = SSF2API.getProjectile(this);
            this.visible = false;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.toContinue);
            };
        }

        internal function frame6():*
        {
            this.gotoAndPlay("loop");
        }


    }
}//package link_fla

