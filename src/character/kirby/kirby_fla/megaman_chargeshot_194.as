// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.megaman_chargeshot_194

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class megaman_chargeshot_194 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var speed:Number;
        public var time:int;
        public var self:*;
        public var character:*;
        public var scale:*;

        public function megaman_chargeshot_194()
        {
            addFrameScript(0, this.frame1);
        }

        public function destroy(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.destroy);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.destroy);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.destroy);
            this.self.destroy();
        }

        internal function frame1():*
        {
            this.speed = 0;
            this.time = 0;
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                this.scale = (0.2 + (this.self.getAttackStat("chargetime") / this.self.getAttackStat("chargetime_max")));
                if (this.scale > 1)
                {
                    this.scale = 1;
                };
                this.self.setScale(this.scale, this.scale);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.destroy);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.destroy);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.destroy);
            };
        }


    }
}//package kirby_fla

