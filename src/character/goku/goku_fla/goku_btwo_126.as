// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.goku_btwo_126

package goku_fla
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

    public dynamic class goku_btwo_126 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;

        public function goku_btwo_126()
        {
            addFrameScript(0, this.frame1, 16, this.frame17, 17, this.frame18);
        }

        public function followGoku():void
        {
            if (!this.character.isOnGround())
            {
                if (this.character.getCharacterStat("statsName") === "kirby")
                {
                    if (!this.character.isFacingRight())
                    {
                        this.self.setX((this.character.getX() - 30));
                    }
                    else
                    {
                        this.self.setX((this.character.getX() + 30));
                    };
                    this.self.setY((this.character.getY() - 15));
                }
                else
                {
                    if (!this.character.isFacingRight())
                    {
                        this.self.setX((this.character.getX() - 30));
                    }
                    else
                    {
                        this.self.setX((this.character.getX() + 30));
                    };
                    this.self.setY((this.character.getY() - 38));
                };
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                SSF2API.createTimer(this.self, 1, -1, this.followGoku);
            };
        }

        internal function frame17():*
        {
            this.self.destroy();
        }

        internal function frame18():*
        {
            this.gotoAndStop("stopped2");
        }


    }
}//package goku_fla

