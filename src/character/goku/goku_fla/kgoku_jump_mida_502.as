// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.kgoku_jump_mida_502

package goku_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class kgoku_jump_mida_502 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function kgoku_jump_mida_502()
        {
            addFrameScript(0, this.frame1, 15, this.frame16, 17, this.frame18);
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

        internal function frame16():*
        {
            this.xframe = "hover";
        }

        internal function frame18():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }


    }
}//package goku_fla

