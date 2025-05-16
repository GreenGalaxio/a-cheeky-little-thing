// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_downbbomb_112

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

    public dynamic class samus_downbbomb_112 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var count:*;
        public var character:*;
        public var bomb:*;
        public var samus:*;
        public var range:*;

        public function samus_downbbomb_112()
        {
            addFrameScript(0, this.frame1, 34, this.frame35, 35, this.frame36, 39, this.frame40);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.jumpToContinue);
            gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            this.count = 0;
            parent.scaleX = 1.75;
            parent.scaleY = 1.75;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToContinue);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.jumpToContinue);
            };
        }

        internal function frame35():*
        {
            this.bomb = parent;
            this.samus = this.character.getMC();
            this.range = 25;
            SSF2API.playSound("brawl_bomb_s");
            this.self.updateAttackStats({"allowControl":true});
            this.self.updateAttackBoxStats(1, {
                "damage":7,
                "power":80,
                "hitStun":1,
                "selfHitStun":1,
                "priority":-1,
                "hasEffect":true
            });
            this.self.refreshAttackID();
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.updateProjectileStats({"maxgravity":0});
            if (((((this.samus.x >= (this.bomb.x - this.range)) && (this.samus.x <= (this.bomb.x + this.range))) && (this.samus.y >= (this.bomb.y - this.range))) && (this.samus.y <= (this.bomb.y + this.range))))
            {
                this.character.rocketCharacter(11.5, 90, -1, false);
            };
        }

        internal function frame36():*
        {
            if (((((this.samus.x >= (this.bomb.x - this.range)) && (this.samus.x <= (this.bomb.x + this.range))) && (this.samus.y >= (this.bomb.y - this.range))) && (this.samus.y <= (this.bomb.y + this.range))))
            {
                this.character.rocketCharacter(11.5, 90, -1, false);
            };
        }

        internal function frame40():*
        {
            this.self.destroy();
        }


    }
}//package samus_fla

