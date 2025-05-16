// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_edge_lean_188

package sonic_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class sonic_edge_lean_188 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function sonic_edge_lean_188()
        {
            addFrameScript(0, this.frame1, 19, this.frame20);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.playSound("teeter");
            };
        }

        internal function frame20():*
        {
            this.gotoAndPlay("loop");
        }


    }
}//package sonic_fla

