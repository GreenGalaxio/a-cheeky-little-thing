// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_new_bomb_held_123

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

    public dynamic class link_new_bomb_held_123 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var self:*;
        public var finished:Boolean;
        public var selfDestruct:int;
        public var maxLoop:*;
        public var loop:*;
        public var character:*;

        public function link_new_bomb_held_123()
        {
            addFrameScript(0, this.frame1, 12, this.frame13, 13, this.frame14, 17, this.frame18, 18, this.frame19, 28, this.frame29);
        }

        public function blowUp(_arg_1:*):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ITEM_HURT, this.blowUp);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.blowUp);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.blowUp);
            SSF2API.removeEventListener(this.self, SSF2Event.ITEM_DESTROYED, this.blowUp);
            this.self.setGlobalVariable("loop", 0);
            this.self.setGlobalVariable("warningLoop", 0);
            this.gotoAndPlay("finish");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getItem(this);
            this.finished = false;
            this.selfDestruct = 0;
            this.maxLoop = 10;
            this.loop = 0;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                SSF2API.addEventListener(this.self, SSF2Event.ITEM_HURT, this.blowUp);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.blowUp);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.blowUp);
                SSF2API.addEventListener(this.self, SSF2Event.ITEM_DESTROYED, this.blowUp);
                this.self.setGlobalVariable("exploding", false);
                if (this.self.getGlobalVariable("loop") >= this.maxLoop)
                {
                    this.gotoAndPlay("warning");
                }
                else
                {
                    this.loop = this.self.getGlobalVariable("loop");
                };
            };
        }

        internal function frame13():*
        {
            this.loop++;
            this.self.setGlobalVariable("loop", this.loop);
            if (this.loop < this.maxLoop)
            {
                gotoAndPlay("loop");
            }
            else
            {
                this.loop = 0;
            };
        }

        internal function frame14():*
        {
            this.maxLoop = 6;
            if (this.self.getGlobalVariable("warningLoop") >= this.maxLoop)
            {
                gotoAndPlay("finish");
            }
            else
            {
                this.loop = this.self.getGlobalVariable("warningLoop");
            };
        }

        internal function frame18():*
        {
            this.loop++;
            this.self.setGlobalVariable("warningLoop", this.loop);
            if (this.loop > this.maxLoop)
            {
                gotoAndPlay("finish");
            }
            else
            {
                gotoAndPlay("warning");
            };
        }

        internal function frame19():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ITEM_HURT, this.blowUp);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.blowUp);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.blowUp);
            SSF2API.removeEventListener(this.self, SSF2Event.ITEM_DESTROYED, this.blowUp);
            SSF2API.playSound("brawl_bomb_l");
            this.self.updateAttackBoxStats(1, {
                "hurtSelf":true,
                "priority":-1
            });
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.updateItemStats({
                "max_gravity":0,
                "canPickup":false
            });
            this.self.setGlobalVariable("loop", 0);
            this.self.setGlobalVariable("warningLoop", 0);
            this.self.setGlobalVariable("exploding", true);
            this.character = SSF2API.getCharacter(this.self.getID());
            if (((this.character) && (this.character.getItem() == this.self)))
            {
                this.character.dropItem();
            };
        }

        internal function frame29():*
        {
            this.self.setGlobalVariable("loop", 0);
            this.self.setGlobalVariable("warningLoop", 0);
            this.self.destroy();
        }


    }
}//package link_fla

