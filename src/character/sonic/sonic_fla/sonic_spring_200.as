// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_spring_200

package sonic_fla
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

    public dynamic class sonic_spring_200 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var self:*;
        public var ySpeed:Number;
        public var character:*;

        public function sonic_spring_200()
        {
            addFrameScript(0, this.frame1, 28, this.frame29, 29, this.frame30);
        }

        public function bounce(_arg_1:*=null):*
        {
            this.self.setYSpeed(this.ySpeed);
            this.ySpeed = (this.ySpeed / 2);
            if (this.ySpeed > -1)
            {
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
                gotoAndPlay("continue");
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.ySpeed = -12;
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.self.destroy);
                this.character = SSF2API.getCharacter(this.self.getID());
            };
        }

        internal function frame29():*
        {
            this.gotoAndPlay("loop");
        }

        internal function frame30():*
        {
            this.self.destroy();
            this.gotoAndPlay("loop");
        }


    }
}//package sonic_fla

