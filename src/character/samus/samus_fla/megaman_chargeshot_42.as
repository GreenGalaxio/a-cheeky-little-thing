// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.megaman_chargeshot_42

package samus_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class megaman_chargeshot_42 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var speed:Number;
        public var time:int;
        public var self:*;
        public var character:*;
        public var scale:*;
        public var damage:*;

        public function megaman_chargeshot_42()
        {
            addFrameScript(0, this.frame1);
        }

        public function destroy(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.destroy);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.destroy);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.destroy);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.destroy);
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
                if (this.self.getAttackBoxStat(1, "damage") != 25)
                {
                    this.damage = (22 * (this.self.getAttackStat("chargetime") / this.self.getAttackStat("chargetime_max")));
                    if (this.damage < 5)
                    {
                        this.damage = 5;
                    };
                    this.self.updateAttackBoxStats(1, {"damage":this.damage});
                };
                this.self.setScale(this.scale, this.scale);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.destroy);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.destroy);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.destroy);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.destroy);
            };
        }


    }
}//package samus_fla

