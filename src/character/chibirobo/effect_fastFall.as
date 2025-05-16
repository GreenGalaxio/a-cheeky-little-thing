// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//effect_fastFall

package 
{
    import flash.display.MovieClip;

    public dynamic class effect_fastFall extends MovieClip 
    {

        public function effect_fastFall()
        {
            addFrameScript(4, this.frame5);
        }

        internal function frame5():*
        {
            stop();
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

