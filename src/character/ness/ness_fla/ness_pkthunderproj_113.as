// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_pkthunderproj_113

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.system.*;
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
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class ness_pkthunderproj_113 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var camBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;

        public function ness_pkthunderproj_113()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 7, this.frame8, 8, this.frame9);
        }

        public function sendToEnd(_arg_1:*):*
        {
            if (((((this.character.getMC().currentLabel == "b_up") || (this.character.getMC().currentLabel == "b_up_air")) && (!(this.character.getCurrentProjectile() == null))) && ((!(this.character.getCurrentProjectile().getLinkageID())) == "ness_pkthunderproj")))
            {
                this.character.getStanceMC().gotoAndPlay("end");
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                this.self.addToCamera();
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.destroy);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.self.destroy);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.self.destroy);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.self.destroy);
                SSF2API.addEventListener(this.self, SSF2Event.PROJ_DESTROYED, this.sendToEnd);
            };
        }

        internal function frame7():*
        {
            gotoAndPlay("loop");
        }

        internal function frame8():*
        {
            this.self.removeFromCamera();
        }

        internal function frame9():*
        {
            this.self.destroy();
        }


    }
}//package ness_fla

