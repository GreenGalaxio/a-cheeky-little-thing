// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.ssgoku_midairjump_570

package goku_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class ssgoku_midairjump_570 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function ssgoku_midairjump_570()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 10, this.frame11);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = "midair";
                this.done = false;
            };
        }

        internal function frame9():*
        {
            this.xframe = "hover";
        }

        internal function frame11():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }


    }
}//package goku_fla

