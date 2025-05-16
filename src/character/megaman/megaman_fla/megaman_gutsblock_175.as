// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_gutsblock_175

package megaman_fla
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

    public dynamic class megaman_gutsblock_175 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var player_id:Number;
        public var character:*;

        public function megaman_gutsblock_175()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6);
        }

        public function crashAndDie(_arg_1:*=null):*
        {
            this.self.attachEffect("megaman_gutsblockbreak");
            this.self.destroy();
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            this.player_id = 0;
        }

        internal function frame2():*
        {
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.crashAndDie);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.crashAndDie);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.crashAndDie);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.crashAndDie);
            };
            stop();
        }

        internal function frame3():*
        {
            this.gotoAndStop("wait");
        }

        internal function frame4():*
        {
            this.character.playSpecificSound("megaman_explosion");
        }

        internal function frame5():*
        {
            stop();
        }

        internal function frame6():*
        {
            this.gotoAndStop("stopped");
        }


    }
}//package megaman_fla

